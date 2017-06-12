#!/usr/bin/env python
'''Synchronize git workspace directories'''

import os
import subprocess
import queue
import threading
import multiprocessing
from funcy import compose
from funcy import partial

NPROC = int(multiprocessing.cpu_count() * 2 / 3)
WORKSPACE_DIR = os.path.join(os.environ['HOME'], 'workspace')
EXCLUDES = [
    'tmp',
    'deps',
    'fixtures',
    'temp']


class GitSyncRunner(threading.Thread):
    '''Threaded git synchronization runner'''
    def __init__(self, wqueue):
        threading.Thread.__init__(self)
        self.wqueue = wqueue

    def run(self):
        '''thread entry point'''
        while True:
            git_project = self.wqueue.get()
            self.perform_git_sync(git_project)

    def perform_git_sync(self, git_project):
        '''perform git synchronization'''
        subprocess.call(['git', '-C', git_project, 'remote', 'update', '-p'],
                        stdout=subprocess.DEVNULL,
                        stderr=subprocess.DEVNULL)
        self.wqueue.task_done()


def main(workspace):
    '''main entry'''
    wqueue = collect_git_projects(workspace)
    for _ in range(NPROC):
        thread = GitSyncRunner(wqueue)
        thread.setDaemon(True)
        thread.start()
    wqueue.join()


def collect_git_projects(workspace):
    '''Collect the git projects in `workspace`'''
    wqueue = queue.Queue()
    compose(lambda projects: list(wqueue.put(x) for x in projects),
            partial(filter_project_folders, EXCLUDES),
            get_git_projects)(workspace)
    return wqueue


def get_git_projects(workspace):
    '''walk workspace, collecting .git folders'''
    def __walk__(path):
        for root, dirs, _ in os.walk(path):
            if '.git' in dirs:
                dirs.remove('.git')
                yield root
    return __walk__(workspace)


def filter_project_folders(excludes, projects):
    '''filter out project folders based on `excludes`'''
    def __path_in_excludes__(path):
        for exclude in excludes:
            if exclude in path:
                return True
        return False
    for project in projects:
        if __path_in_excludes__(project):
            continue
        yield project


if __name__ == '__main__':
    main(WORKSPACE_DIR)

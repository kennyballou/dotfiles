(define-module (kbg services config maven)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (guix gexp)
  #:use-module (gnu packages java)
  #:use-module (gnu home services))

(define-public maven-config-service
  (list (simple-service 'maven-config
                        home-files-service-type
                        `((".m2/settings.xml"
                          ,(local-file (string-append %dotfiles-root "config/maven/settings.xml")))
                          (".m2/toolchains.xml"
                           ,(mixed-text-file "toolchains.xml"
                                             #~(string-append "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
                                                              "<toolchains>\n"
                                                              "<toolchain>\n"
                                                              "<type>jdk</type>\n"
                                                              "<provides>\n"
                                                              "<version>9</version>\n"
                                                              "<vendor>OpenJDK</vendor>\n"
                                                              "</provides>\n"
                                                              "<configuration>\n"
                                                              "<jdkHome>" #+openjdk9:jdk "</jdkHome>\n"
                                                              "</configuration>\n"
                                                              "</toolchain>\n"
                                                              "<toolchain>\n"
                                                              "<type>jdk</type>\n"
                                                              "<provides>\n"
                                                              "<version>11</version>\n"
                                                              "<vendor>OpenJDK</vendor>\n"
                                                              "</provides>\n"
                                                              "<configuration>\n"
                                                              "<jdkHome>" #+openjdk11:jdk "</jdkHome>\n"
                                                              "</configuration>\n"
                                                              "</toolchain>\n"
                                                              "<toolchain>\n"
                                                              "<type>jdk</type>\n"
                                                              "<provides>\n"
                                                              "<version>19</version>\n"
                                                              "<vendor>OpenJDK</vendor>\n"
                                                              "</provides>\n"
                                                              "<configuration>\n"
                                                              "<jdkHome>" #+openjdk19:jdk "</jdkHome>\n"
                                                              "</configuration>\n"
                                                              "</toolchain>\n"
                                                              "</toolchains>\n")))))))

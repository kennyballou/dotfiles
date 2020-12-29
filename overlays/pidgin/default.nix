self: super:
{
  pidgin-with-plugins = super.pidgin-with-plugins.override {
    plugins = with super; [
      pidgin-otr
      pidgin-sipe
      pidgin-latex
      purple-hangouts
      purple-slack
      telegram-purple
      purple-matrix
      pidgin-carbons
      pidgin-window-merge
      toxprpl
    ];
  };
}

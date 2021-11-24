{

  less = "less -R";
  ls = "exa";
  ll = "exa -l";

  tree = "tre";

  gs = "git status";
  gco = "git checkout";

  # When emacs is run in nox mode I don't want it to use 256 colors.
  emacs = "TERM=xterm emacs";

  # oni2-appimage="appimage-run /home/brian/Downloads/Onivim2-x86_64-master.AppImage --force-device-scale-factor 2";
  ssh-kaisa = "ssh 104.131.83.148";
  ssh-kaisa-syncthing = "echo \"visit localhost:8385\" && ssh -L 8385:localhost:8384 104.131.83.148";
  ssh-kilvin = "ssh kilvin.farmvision.io";
  ssh-kvothe = "ssh kilvin.farmvision.io -p 8004";
}


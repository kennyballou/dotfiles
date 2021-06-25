{ ... }:
let
  lemp10 = "00ffffffffffff000daed51400000000281a0104a51f117802ee95a3544c99260f505400000001010101010101010101010101010101b43b804a71383440503c680035ad10000018000000fe004e3134304843452d454e320a20000000fe00434d4e0a202020202020202020000000fe004e3134304843452d454e320a200010";
  dell-ultrasharp = "00ffffffffffff0010ac5a41573438370b1f0104a53c22783eee95a3544c99260f5054a54b00714f8180a940d1c00101010101010101565e00a0a0a029503020350055502100001a000000ff0037424a595138330a2020202020000000fc0044454c4c205532373139440a20000000fd00384c1e5a19010a20202020202001be02031cf14f90050403020716010611121513141f23097f0783010000023a801871382d40582c450055502100001e7e3900a080381f4030203a0055502100001a011d007251d01e206e28550055502100001ebf1600a08038134030203a0055502100001a00000000000000000000000000000000000000000000000000000012";
  benq-p27 = "00ffffffffffff0009d12480455400001c1c0103803c2278263f05a9544ca1260e5054a56b80818081c08100a9c0b300d1c001010101565e00a0a0a029503020350055502100001a000000ff0041374a30303335393031390a20000000fd00324c1e591b000a202020202020000000fc0042656e51204c43440a20202020017e020324f14f901f05140413031207161501061102230907078301000067030c0010003832023a801871382d40582c450056502100001f011d8018711c1620582c250056502100009f011d007251d01e206e28550056502100001e8c0ad08a20e02d10103e960056502100001800000000000000000000000000000000000000d9";
  hansg = "00ffffffffffff00226437650000000020150103803b2178eac345a357529e270c5054bfef80d1c0b300a9409500904081808140714f023a801871382d40582c450055502100001e000000ff0031323334353637383930313233000000fd00384b185312000a202020202020000000fc00484c3237324850420a2020202001d2020325f24d9f901413121e1601040507030e230907078301000067030c001000382de2004f8c0ad08a20e02d10103e9600555021000018011d8018711c1620582c250055502100009e023a801871382d40582c450055502100001e011d80d0721c1620102c258055502100009e023a80d072382d40102c458055502100001ef4";
in {
  programs.autorandr = {
    enable = true;
    hooks.postswitch."reset-background" = "systemctl --user start background.service";
    profiles = {
      "default" = {
        fingerprint = {
          eDP-1 = lemp10;
        };
        config = {
          eDP-1 = {
            enable = true;
            primary = true;
            position = "0x0";
            mode = "1920x1080";
          };
        };
      };
      "home" = {
        fingerprint = {
          eDP-1 = lemp10;
          DP-1 = benq-p27;
        };
        config = {
          eDP-1 = {
            enable = false;
            primary = false;
          };
          DP-1 = {
            enable = true;
            primary = true;
            position = "0x0";
            mode = "2560x1440";
            crtc = 0;
            rate = "59.95";
          };
        };
      };
      "nil" = {
        fingerprint = {
          eDP-1 = lemp10;
          DP-1 = hansg;
        };
        config = {
          eDP-1 = {
            enable = true;
            primary = true;
            position = "0x1080";
            mode = "1920x1080";
          };
          DP-1 = {
            enable = true;
            primary = false;
            position = "0x0";
            mode = "1920x1080";
            rate = "60.00";
          };
        };
      };
      "work" = {
        fingerprint = {
          eDP-1 = lemp10;
          DP-1 = dell-ultrasharp;
        };
        config = {
          eDP-1 = {
            enable = false;
            primary = false;
          };
          DP-1 = {
            enable = true;
            primary = true;
            position = "0x0";
            mode = "2560x1440";
            crtc = 0;
            rate = "59.95";
          };
        };
      };
    };
  };
}

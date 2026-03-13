#!/bin/bash

# COLORS - RED THEME
R="\e[1;31m"  # Bright Red
G="\e[1;32m"  # Green
Y="\e[1;33m"  # Yellow
B="\e[1;34m"  # Blue
C="\e[1;36m"  # Cyan
M="\e[1;35m"  # Magenta
W="\e[1;37m"  # White
N="\e[0m"     # Reset

# JISHNU NETWORK ASCII ART
print_jishnu_logo() {
    echo -e "\n${R}╔════════════════════════════════════════════════════════════════════════════════════╗${N}"
    echo -e "${R}║${W}██████╗ ██╗██╗  ██╗██╗     ███████╗███╗   ██╗██╗███╗   ██╗     ██╗ █████╗           ${R}║${N}"
    echo -e "${R}║${W}██╔══██╗██║╚██╗██╔╝██║     ██╔════╝████╗  ██║██║████╗  ██║     ██║██╔══██╗          ${R}║${N}"
    echo -e "${R}║${W}██████╔╝██║ ╚███╔╝ ██║     █████╗  ██╔██╗ ██║██║██╔██╗ ██║     ██║███████║          ${R}║${N}"
    echo -e "${R}║${W}██╔═══╝ ██║ ██╔██╗ ██║     ██╔══╝  ██║╚██╗██║██║██║╚██╗██║██   ██║██╔══██║          ${R}║${N}"
    echo -e "${R}║${W}██║     ██║██╔╝ ██╗███████╗███████╗██║ ╚████║██║██║ ╚████║╚█████╔╝██║  ██║          ${R}║${N}"
    echo -e "${R}║${W}╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚════╝ ╚═╝  ╚═╝          ${R}║${N}"
    echo -e "${R}║${Y}                      Vps Maker                                                     ${R}║${N}"
    echo -e "${R}╚════════════════════════════════════════════════════════════════════════════════════╝${N}"
    echo -e "${Y}                    Made by PixleNinja                       ${N}\n"
}

# NEW UI STYLE FUNCTIONS
print_box() {
    local text="$1"
    local color="$2"
    local width=52
    local padding=$(( (width - ${#text} - 2) / 2 ))
    
    echo -e "${color}╔$(printf '═%.0s' $(seq 1 $((width-2))))╗${N}"
    printf "${color}║%*s${W}%s${color}%*s║${N}\n" $padding "" "$text" $((padding - ((${#text} % 2) ? 1 : 0))) ""
    echo -e "${color}╚$(printf '═%.0s' $(seq 1 $((width-2))))╝${N}"
}

print_header() {
    clear
    print_jishnu_logo
    echo -e "${R}══════════════════════════════════════════════════════════${N}"
    echo -e "${W}            DEVELOPMENT MANAGEMENT CONSOLE             ${N}"
    echo -e "${R}══════════════════════════════════════════════════════════${N}\n"
}

print_option() {
    local num="$1"
    local text="$2"
    local color="$3"
    
    echo -e "  ${color}╔══════════════════════════════════════════════╗${N}"
    echo -e "  ${color}║${W}  [${R}$num${W}]  ${Y}$text$(printf '%*s' $((33 - ${#text} - 6)))${color}║${N}"
    echo -e "  ${color}╚══════════════════════════════════════════════╝${N}\n"
}

print_status() {
    local text="$1"
    local color="$2"
    echo -e "\n${R}▶▶${color} ${text}${N}\n"
}

print_divider() {
    echo -e "${R}══════════════════════════════════════════════════════════${N}"
}

print_footer() {
    echo -e "${R}┌──────────────────────────────────────────────────────┐${N}"
    echo -e "${R}│${W}         PixleNinja © 2026 - All Rights Reserved ${R}│${N}"
    echo -e "${R}└──────────────────────────────────────────────────────┘${N}\n"
}

# MAIN MENU LOOP
while true; do
    print_header
    
    echo -e "${R}╔══════════════════════════════════════════════════════════╗${N}"
    echo -e "${R}║${Y}                    MAIN OPTIONS                      ${R}║${N}"
    echo -e "${R}╚══════════════════════════════════════════════════════════╝${N}\n"
    
      print_option "1" "🔧 IDX Tool Setup" "$R"
      print_option "2" "⚡ IDX VPS Maker" "$R"
      print_option "5" "❌ Exit" "$R"

    
    print_divider
    echo -ne "${R}▶▶${W} Select Option [${R}1-5${W}] : ${Y}"
    read -p "" op
    echo -ne "${N}"
    
    case $op in
    # =========================================================
    # (2) IDX TOOL SETUP - ENHANCED WITH Pixle THEME
    # =========================================================
    1)
        clear
        print_jishnu_logo
        print_status "🔧 IDX TOOL SETUP" "$R"
        print_divider
        echo
        
        echo -e "${R}╔══════════════════════════════════════════════════════════╗${N}"
        echo -e "${R}║${W}              IDX DEVELOPMENT TOOL SETUP               ${R}║${N}"
        echo -e "${R}╚══════════════════════════════════════════════════════════╝${N}\n"
        
        echo -e "${Y}🧹 Cleaning up old files...${N}"
        cd
        rm -rf myapp
        rm -rf flutter
        
        cd vps123
        
        if [ ! -d ".idx" ]; then
            echo -e "${G}📁 Creating .idx directory...${N}"
            mkdir .idx
            cd .idx
            
            echo -e "${C}📝 Creating dev.nix configuration...${N}"
            echo -e "${Y}──────────────────────────────────────────────────────${N}"
            
            cat <<EOF > dev.nix
{ pkgs, ... }: {
  channel = "stable-24.05";

  packages = with pkgs; [
    unzip
    openssh
    git
    qemu_kvm
    sudo
    cdrkit
    cloud-utils
    qemu
  ];

  env = {
    EDITOR = "nano";
  };

  idx = {
    extensions = [
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
    ];

    workspace = {
      onCreate = { };
      onStart = { };
    };

    previews = {
      enable = false;
    };
  };
}
EOF
            
            echo -e "${Y}──────────────────────────────────────────────────────${N}"
            echo -e "\n${G}✅ IDX TOOL SETUP COMPLETE!${N}"
            echo -e "${R}┌──────────────────────────────────────────────────────┐${N}"
            echo -e "${R}│${W} ${G}Status${W}   : ${Y}Ready to use${W}                        ${R}│${N}"
            echo -e "${R}│${W} ${G}Location${W} : ${Y}~/vps123/.idx${W}                       ${R}│${N}"
            echo -e "${R}│${W} ${G}Tool${W}     : ${Y}IDX Development Environment${W}         ${R}│${N}"
            echo -e "${R}│${W} ${G}Version${W}  : ${Y}Stable 24.05${W}                        ${R}│${N}"
            echo -e "${R}└──────────────────────────────────────────────────────┘${N}"
        else
            echo -e "${R}┌──────────────────────────────────────────────────────┐${N}"
            echo -e "${R}│${Y} ⚠ IDX Tool already setup — skipping.${W}               ${R}│${N}"
            echo -e "${R}│${W} Location: ${Y}~/vps123/.idx${W}                          ${R}│${N}"
            echo -e "${R}└──────────────────────────────────────────────────────┘${N}"
        fi
        
        echo -e "\n${R}══════════════════════════════════════════════════════════${N}"
        echo -ne "${R}▶▶${W} Press Enter to return to main menu...${N}"
        read -p ""
        ;;
    
    # =========================================================
    # (3) IDX VPS MAKER — ENHANCED WITH PixleNinja THEME
    # =========================================================
    3)
        clear
        print_jishnu_logo
        print_status "⚡ IDX VPS MAKER" "$R"
        print_divider
        echo
        
        echo -e "${R}╔══════════════════════════════════════════════════════════╗${N}"
        echo -e "${R}║${W}              IDX VPS CREATION TOOL                  ${R}║${N}"
        echo -e "${R}╚══════════════════════════════════════════════════════════╝${N}\n"
        
        echo -e "${C}📡 Connecting to GitHub repository...${N}"
        echo -e "${Y}──────────────────────────────────────────────────────${N}"
        
        echo -e "\n${R}▶▶${W} Executing IDX VPS Maker script...${N}"
        echo -e "${Y}──────────────────────────────────────────────────────${N}"
        
        bash <(curl -s https://raw.githubusercontent.com/jishnu-limited/app-build-journey/refs/heads/main/vpmakerkvmidx)
        
        echo -e "\n${R}══════════════════════════════════════════════════════════${N}"
        echo -e "${R}▶▶${W} IDX VPS Maker execution completed.${N}"
        echo -ne "${R}▶▶${W} Press Enter to return to main menu...${N}"
        read -p ""
        ;;
    # =========================================================
    # EXIT - ENHANCED WITH PixleNinja THEME
    # =========================================================
    5)
        clear
        print_jishnu_logo
        echo -e "${R}══════════════════════════════════════════════════════════${N}"
        echo -e "${W}                  SESSION TERMINATED                   ${N}"
        echo -e "${R}══════════════════════════════════════════════════════════${N}\n"
        
        echo -e "${R}┌──────────────────────────────────────────────────────┐${N}"
        echo -e "${R}│${W}     Thank you for using PixleNinja Vps Maker!     ${R}│${N}"
        echo -e "${R}│${Y}              Made with ❤️ by PixleNinja           ${R}│${N}"
        echo -e "${R}└──────────────────────────────────────────────────────┘${N}"
        
        echo -e "\n${Y}👋 Goodbye! Come back soon...${N}\n"
        print_footer
        sleep 2
        exit 0
        ;;
    
    *)
        echo -e "\n${R}╔══════════════════════════════════════════════════════════╗${N}"
        echo -e "${R}║${W}                ❌ INVALID OPTION!                     ${R}║${N}"
        echo -e "${R}║${Y}         Please choose between 1-4 only                ${R}║${N}"
        echo -e "${R}╚══════════════════════════════════════════════════════════╝${N}"
        sleep 2
        ;;
    esac
done
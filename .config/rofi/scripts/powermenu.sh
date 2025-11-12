#!/usr/bin/env bash
# file: ~/bin/rofi-power.sh
# make it executable → chmod +x ~/bin/rofi-power.sh

# -------------------------------------------------
# 1️⃣  Initial call (ROFI_RETV == 0)
# -------------------------------------------------
if [ "${ROFI_RETV:-0}" -eq 0 ]; then
  # Print the menu – one entry per line
  printf "🔒 Lock\n"
  printf "💤 Suspend\n"
  printf "🌙 Hibernate\n"
  printf "🔄 Reboot\n"
  printf "⏻  Shutdown\n"
  printf "👋 Log out\n"
  exit 0
fi

# -------------------------------------------------
# 2️⃣  User selected an entry (ROFI_RETV == 1)
# -------------------------------------------------
# Rofi passes the chosen line as $1
CHOSEN="${1:-}" ## Expansion: if argument doesn't exist, fill with empty string

case "$CHOSEN" in
*Lock)
  nohup cinnamon-screensaver-command --lock >/dev/null 2>&1 &
  ;;
*Suspend) systemctl suspend -i ;;
*Hibernate) systemctl hibernate -i ;;
*Reboot) systemctl reboot -i ;;
*Shutdown) systemctl poweroff -i ;;
*Log\ out) cinnamon-session-quit --logout --no-prompt ;;
*) exit 1 ;; # unknown entry
esac

#have restart &&
_restart_complete()
{
  local cur prev

  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}

  if [ $COMP_CWORD -eq 1 ]; then
    COMPREPLY=( $(compgen -W "alsa bind bind9 chrome deluged edit icecast mpd network networking nfs now pipewire pulseaudio serviio shout minidlna" -- $cur) )
  elif [ $COMP_CWORD -eq 2 ]; then
    case "$prev" in
      "minidlna")
        COMPREPLY=( $(compgen -W "restart force-reload rescan" -- $cur) )
        ;;
#      "deploy")
#        COMPREPLY=( $(compgen -W "all current" -- $cur) )
#        ;;
      *)
        ;;
    esac
  fi

  return 0
} &&
complete -F _restart_complete restart

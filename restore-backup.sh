if [ -n "$WINDOWS_HOME" ]; then
    SOURCE="$WINDOWS_HOME/wsl-backup/$USER";  
    TARGET=~
    cp -v "$SOURCE/.profile" $TARGET
    cp -v "$SOURCE/.variables" $TARGET
    cp -v "$SOURCE/.aliase" $TARGET
    cp -v "$SOURCE/.zsh_history" $TARGET
else 
    echo "variable WINDOWS_HOME not defined"
fi
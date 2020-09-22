if [ -n "$WINDOWS_HOME" ]; then
    SOURCE="$WINDOWS_HOME/wsl-backup/$USER";  
    TARGET=~
    cp -v "$SOURCE/TOKEN.txt" $TARGET
    cp -v "$SOURCE/.profile" $TARGET
    cp -rv "$SOURCE/.gnupg" $TARGET/.gnupg
    cp -v "$SOURCE/.git-credentials" $TARGET
    cp -v "$SOURCE/.zsh_history" $TARGET
else 
    echo "variable WINDOWS_HOME not defined"
fi
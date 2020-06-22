mkdir -p "$HOME/Library/Developer/Xcode/UserData/CodeSnippets"
find ./xcode_code_snippet/*.codesnippet | xargs -I{} zsh -c "cp {} $HOME/Library/Developer/Xcode/UserData/CodeSnippets"

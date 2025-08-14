# Pyenv settings
# if [[ -e $(which pyenv) ]]; then
#     export PYENV_ROOT="$HOME/.pyenv"
#     [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#     eval "$(pyenv init -)"
#     eval "$(pyenv virtualenv-init -)"
# fi

# Auto-activate conda env when changing directory
# Create a .conda_config file inside the directory you want to activate the env for
# The .conda_config file must contain only the env name.
cd() { builtin cd "$@" && 
if [ -f $PWD/.conda_config ]; then
    export CONDACONFIGDIR=$PWD
    conda activate $(cat .conda_config)
elif [ "$CONDACONFIGDIR" ]; then
    if [[ $PWD != *"$CONDACONFIGDIR"* ]]; then
        export CONDACONFIGDIR=""
        conda deactivate
    fi
fi }

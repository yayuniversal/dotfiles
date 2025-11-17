function isbash {
    [[ -n "$BASH_VERSION" ]]
}

function iszsh {
    [[ -n "$ZSH_VERSION" ]]
}

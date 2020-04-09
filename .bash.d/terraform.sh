alias terraform='docker run -v $HOME/.aws/credentials:/root/.aws/credentials -v $HOME/.aws/config:/root/.aws/config -v $(pwd):/tmp/code taylorm/terraform'

#!/bin/bash

HERE=$(cd `dirname $0` > /dev/null && pwd)

export GEM_HOME=$HERE/.gems
export GEM_PATH=$GEM_HOME
export PATH=$GEM_HOME/bin:$PATH

gem install vendor/bundle/bundler-1.2.3.gem --bindir $HERE/bin
$HERE/bin/bundle install --local --path .bundle --binstubs --shebang `which ruby`

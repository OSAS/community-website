# Red Hat Community website

To get started, you need to have Ruby and Ruby Gems installed, as well
as "bundler".


## Initial setup

### Fedora, RHEL, & CentOS

./setup.sh

If you don't clone the repo with `--recursive`, make sure to run
`git submodule init && git submodule update`

Note, you need to have your SSH key on GitHub and be added to the OSAS/rh-events repo as a contributor to be able to clone this recursively. Otherwise Git will bomb out due to permissions issues.

## Running a local server

1. Start a local Middleman server that uses local gems by typing
   `./run-server.sh`

2. Next, browse to <http://0.0.0.0:4567>

3. Edit!

   When you edit files (pages, layouts, CSS, etc.), the site will
   dyanmically update in development mode. (There's no need to refresh
   the page, unless you get a Ruby error.)


## Updating

The `./run-server.sh` script handles changes in the `Gemfile` by including
a `bundle install` before running Middleman.


## Customizing your site

The site can be easily customized by editing `data/site.yml`.


## Adding a Post

To add a post to the community blog:

```
./create-post.rb "Your title here"
```

There are many command line flags and options you can pass to the
create-post script. Run `./create-post.rb` by itself to see all of them.


## Deploying

The Community website is auto-deployed based on git, a few minutes after
a file is committed and pushed to the git repository.

Please do not deploy the site manually.


### Add new features (parsers, etc.)

Simply add a new `gem 'some-gem-here'` line in the `Gemfile` and run
`bundle install`, or restart `./run-server.sh`


## More info

For more information, please check the excellent
[Middleman documentation](http://middlemanapp.com/getting-started/).

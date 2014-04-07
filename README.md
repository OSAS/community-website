# Red Hat Community website

To get started, you need to have Ruby and Ruby Gems installed, as well
as "bundler".


## Initial setup

### Fedora, RHEL, & CentOS

```
sudo yum install -y ruby-devel rubygems gcc-c++ curl-devel rubygem-bundler
git clone --recursive git@gitlab.osas.lab.eng.rdu2.redhat.com:garrett/community-middleman.git
cd community-middleman
bundle install
```

If you don't clone the repo with `--recursive`, make sure to run
`git submodule init && git submodule update`

Note, you need to have your SSH key on GitHub and be added to the OSAS/rh-events repo as a contributor to be able to clone this recursively. Otherwise Git will bomb out due to permissions issues.

## Running a local server

1. Start a local Middleman server that uses local gems by typing
   `bundle exec middleman server`

   (Note: 'server' is optional, but it helps if you're going through
   command-history in bash or zsh with control-r, versus other middleman
   commands like `console`, `build`, or `deploy`)

2. Next, browse to <http://0.0.0.0:4567>

3. Edit!

   When you edit files (pages, layouts, CSS, etc.), the site will
   dyanmically update in development mode. (There's no need to refresh
   the page, unless you get a Ruby error.)


## Updating

When there are new gems in `Gemfile`, just run `bundle install` again.


## Customizing your site

The site can be easily customized by editing `data/site.yml`.


## Adding a Post

To add a post to the community blog (or any blog managed by middleman) use:

```
bundle middleman article TITLE
```

## Deploying

### Setting up deployment

FIXME: Right now, please reference <data/site.yml>


### Actual deployment

You'll need to be added to the `osasteam` group on OpenShift and have
your public key added to your profile.

After copying your public key to the remote server and configuring your
site in <data/site.yml>, deployment is one simple command:
```
bundle exec middleman deploy
```


### Add new features (parsers, etc.)

Simply add a new `gem 'some-gem-here'` line in the `Gemfile` and run
`bundle install`


## More info

For more information, please check the excellent
[Middleman documentation](http://middlemanapp.com/getting-started/).

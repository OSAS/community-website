# Red Hat Community website

To get started, you need to have Ruby and Ruby Gems installed, as well
as "bundler".


## Initial setup

On Fedora, you can run:

### As root

(Only necessary if you don't have ruby, ruby gems, and bundler
installed.)

`sudo yum install -y ruby-devel rubygems gcc-c++ curl-devel rubygem-bundler`

### As user

`git submodule init && git submodule update`
`bundle`

If you clone the repo with `--recursive`, you can skip the submodule step above.

## Updating

When there are new gems in `Gemfile`, just run `bundle` again.


## Running

As we're using gems locally with bundler, you need to run via `bundle exec`:

`bundle exec middleman`


## Customizing your site

The site can be easily customized by editing `data/site.yml`.


## Deploying

### Setting up deployment

FIXME: Right now, please reference data/site.yml

### Actual deployment

`bundle exec middleman deploy`
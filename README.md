# Red Hat Community Website

Welcome to the Red Hat Community Website! This site is the home for information about the Open Source and Standards team, its constituent  communities, and everything you need to get started with upstream projects supported by Red Hat.

This is the source repository for the website, and the home of all documentation, community content, and release management content.

To get started, you need to have Ruby and Ruby Gems installed, as well as "bundler".

## Initial Setup

After cloning a new fork of this site, simply run

```
./setup.sh
```

**Note:** You will also need to have your SSH key on GitHub and be added to the OSAS/rh-events repo as a contributor to be able to clone this rep recursively. Otherwise Git will fail due to permissions issues.

## How to Contribute

All content on this website is community-driven, and we welcome contributions!

Please make sure to work in topic branches and use the pull request process to propose changes. Every change you make to the content will undergo peer-review before it's accepted and merged into the master branch.

### Access the Source Files

You can access the source content in one of the following ways:

1. Fork or clone this repo to your local machine. You can then use your favorite text editor and standard Git commands to work on the files.
To deploy it locally, execute `./run-server.sh` to locally run the website.

2. Next, browse to <http://0.0.0.0:4567>

3. Edit files in your local editor.

Other ways to edit the source files include:

* From the deployed website, scroll down to the bottom of the topic page and click "Edit this page on GitHub". You can then edit the file directly in the GitHub editor.
* From this source repo, click the Edit icon (hover text "Edit this file") at the top-right corner of the topic header. You can then edit the file directly in the GitHub editor.

### Add New Content

All content in the website is written in Markdown. For information on formatting Markdown, see [Markdown Basics](https://help.github.com/articles/markdown-basics/).

You can create a new topic file in one of the following ways:

* From your local Git repo folder, navigate to the relevant directory, create a new text file and save it with the following naming convention: `<name>.html.md`

* From the GitHub repo, navigate to the relevant directory and click the New File button at the top-right corner of the pane.

If you want to use an existing file as a template, click the Edit icon for this README and review the headings, lists, and inline formatting used in this file.

### Add a New Blog Post

If you have an idea for a blog post, we'd love to help you publish it. Follow the steps to access the source files and add new content, and when you submit the pull request the community team will provide editorial review, so don't worry if you are unsure of your writing skills!

**Note:** Blog posts contain additional metadata and naming conventions that Middleman uses to accurately sort and display the content. To ensure consistent formatting, you can use the [first blog post source](https://github.com/OSAS/community-website/blob/master/source/blog/2013-04-03-are-you-open-source-enough.html.md) file name and header as a template. You can also run `./create-post.rb "Your title here"` in your lovcal branch to create a new blog post file.

### Update Existing Content

To modify incorrect, obsolete, or outdated information, you can edit the topic yourself and submit a pull request. The pull request will be reviewed by contributors with commit rights, and if it is accepted it will be merged to the website.

To edit content files, follow the steps in Access the source files section above and edit the file.

### Submit Your Changes

When you finish creating or editing content, commit your changes to a new branch and submit a pull request for review. The commit message should include a detailed description of the changes and as much context as possible.

**Note:** Make sure to submit a pull request even if you have commit rights to the repo, to ensure consistent review and collaboration practices.

After your pull request is merged, the website auto-deploys and you can see the published changes within 10-15 minutes.

## Report Problems or Make Suggestions

If you find a problem with the content, with the website, or have suggestions for new content but unsure how to proceed, you can create a GitHub issue to voice your request or question. All issues are reviewed by the community team and triaged according to severity, priority, and complexity.

To open a GitHub issue, navigate to the GitHub repo website (you are here!) and click the Issues tab in the top navigation bar of the repo. Make sure to search the issues list before you create a new issue, as other contributors might have already reported similar issues.

## Updating Your Local Repo

Occasionally updates to the Middleman components on the remote repository will neccessitate an update your your local Middleman setup. The `./run-server.sh` script handles changes in the `Gemfile` by including a `bundle install` before running Middleman.

## Customizing Your Site

The site can be easily customized by editing `data/site.yml`.

## More info

For more information, please check the excellent [Middleman documentation](http://middlemanapp.com/getting-started/).

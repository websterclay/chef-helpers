Chef Helpers
============

This cookbook is a home for various utility functions / hax to Chef.

Contents
--------

### environment_search

A wrapper around `search` that scopes results that restricts results to only
nodes that are also in the same chef environment as the executing node. This
should be used for all searches as it maximizes the isolation of each
environment from each other. Example:

    environment_search(:node, 'role:dev') == search(:node, "chef_environment:#{node.chef_environment} AND (role:dev)")

Requires chef > 0.10.0.

### sane_logger

Removes the `Processing` messages from the `INFO` level and moves them to the
`DEBUG` level, where they belong ;).

Installation
-----

The easiest way to install this is to use [knife-github-cookbooks](https://github.com/websterclay/knife-github-cookbooks):

    gem install knife-github-cookbooks
    knife github cookbook install websterclay/chef-helpers

Then, put `recipe[helpers]` in your runlist, preferably in your base role.

Author
------

Jesse Newland  
jesse@websterclay.com  
@jnewland  
jnewland on freenode  

License
-------

    Author:: Jesse Newland (<jesse@websterclay.com>)
    Copyright:: Copyright (c) 2011 Webster Clay, LLC
    License:: Apache License, Version 2.0

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
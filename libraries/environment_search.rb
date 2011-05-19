# originally from twitter.com/mitchellh https://gist.github.com/8246b9361b49802d5915
# https://twitter.com/mitchellh/status/71318737235611649
class Chef
    class Recipe
    # This performs a search on the chef server but restricts results
    # to only nodes that are also in the same chef environment as this node.
    # This should be used for all searches as it maximizes the isolation
    # of each environment from each other.

    # All other arguments are passed on to Chef::Search::Query.new.search
    def environment_search(*args, &block)
      # extract the original query
      query = args[1] || "*:*"

      # prepend the environment to the query
      args[1] = "chef_environment:#{node.chef_environment} AND (#{query})"

      # call the original search method
      search(*args, &block)
    end
  end
end
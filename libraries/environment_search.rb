# from twitter.com/mitchellh https://gist.github.com/8246b9361b49802d5915
class Chef
    class Recipe
    # This performs a node search on the chef server but restricts results
    # to only nodes that are also in the same chef environment as this node.
    # This should be used for all searches as it maximizes the isolation
    # of each environment from each other.
    def environment_search(query=nil, environment=nil, &block)
      # Default the environment that is searched to our current environment
      environment ||= node.chef_environment

      # Default query to include all results
      query ||= "chef:[* TO *]"

      search(:node, "chef_environment:#{environment} AND (#{query})", &block)
    end
  end
end
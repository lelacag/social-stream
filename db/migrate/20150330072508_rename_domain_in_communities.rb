class RenameDomainInCommunities < ActiveRecord::Migration
  def change
    rename_column :communities, :domain, :subdomain
  end
end

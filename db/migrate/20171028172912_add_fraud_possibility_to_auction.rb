class AddFraudPossibilityToAuction < ActiveRecord::Migration[5.1]
  def change
    add_column :auctions, :fraud_possibility, :boolean
  end
end

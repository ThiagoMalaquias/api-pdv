class AddCodigoProdutoToProdutos < ActiveRecord::Migration[6.0]
  def change
    add_column :produtos, :codigo_produto, :string
  end
end

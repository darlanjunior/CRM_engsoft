class Banner < ActiveRecord::Base
  attr_accessible :height, :name, :size_type, :width, :image
  has_attached_file :image
  
  has_many :marketing_actions

  def banner_types
  	return {'Cabecalho' => [728, 90], 
                 'Banner' => [468, 60], 
                 'Botao' => [125, 125],
                 'Meio-banner' => [234, 60],
                 'Arranha-ceu' => [120, 600],
                 'Arranha-ceu largo' => [160, 600],
                 'Banner vertical' => [120, 240]}
  end
end

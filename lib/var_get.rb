# To change this template, choose Tools | Templates
# and open the template in the editor.

module VarGet
  # Глобальные параметры приложения
  def sysparam (xname)
    p=Xparam.find(:first,:conditions=>['name=:p and ptype=:t',{:p=>xname,:t=>'SYS'}])
    return nil unless p
    p.value_num||p.value_date||p.value_str
  end

  protected
  # Получить имя текущего модуля
  def get_module_name
     my_class_name = self.class.name
     my_class_name.split("::").first
  end


  # Параметры класса
  def cparam (xname)
    p=Xparam.find(:first,:conditions=>['name=:p and ptype=:t',{:p=>xname,:t=>get_module_name}])
    return nil unless p
    p.value_num||p.value_date||p.value_str
  end

  def get_page_title
    @page_title = "#{sysparam('title')} - #{cparam('title')}"
  end

  def initialize
   get_page_title
  end

end

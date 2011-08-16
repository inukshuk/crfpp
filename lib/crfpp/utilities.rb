
module CRFPP
  
  def learn(template, data, model, options = {})
    Native.learn(['--thread=2', template, data, model].join(' '))
  end
  
  alias train learn
  
  module_function :train, :learn
  
end

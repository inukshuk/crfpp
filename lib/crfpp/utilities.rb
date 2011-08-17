
module CRFPP
  
  # Creates a new Model based on a template and training data.
  #
  # The data parameter can either be an array of strings or a filename. The
  # possible options are:
  #
  # :threads:   False or the number of threads to us (default is 2).
  #
  # :algorithm: L1 or L2 (default)
  #
  # :cost: With this option, you can change the hyper-parameter for the CRFs.
  #        With larger C value, CRF tends to overfit to the give training
  #        corpus. This parameter trades the balance between overfitting and
  #        underfitting. The results will significantly be influenced by this
  #        parameter. You can find an optimal value by using held-out data or
  #        more general model selection method such as cross validation. 
  #
  # :frequency: This parameter sets the cut-off threshold for the features. CRF++
  #         uses the features that occurs no less than NUM times in the given training
  #         data. The default value is 1. When you apply CRF++ to large data, the
  #         number of unique features would amount to several millions. This option is
  #         useful in such cases. 
  #
  def learn(template, data, options = {})
    options = { :threads => 2, :algorithm => :L2, :cost => 1.0, :frequency => 1}.merge(options)
    
    unless File.exists?(data)
      data = save_data_to_tempfile([data].flatten)
      temporary = true
    end

    template = Template.new(template) unless template.is_a?(Template)
    model = Model.new
    
    arguments = []
    
    # TODO check algorithm names
    # arguments << "--algorithm=#{options[:algorithm]}"
    
    arguments << "--cost=#{options[:cost]}"
    arguments << "--thread=#{options[:threads]}"
    arguments << "--freq=#{options[:frequency]}"
    
    arguments << template.path
    arguments << data
    arguments << model.path
    
    success = Native.learn(arguments.join(' '))
    raise NativeError, 'crfpp learn failed' unless success
    
    model
  ensure
    data.unlink if temporary
  end
  
  alias train learn
  
  module_function :train, :learn
  
  private
  
  # Saves data to temporary file and returns the path
  def save_data_to_tempfile(data)
    tmp = Tempfile.new(data)
    tmp.write(data.join("\n"))
    tmp.path
  end
  
end

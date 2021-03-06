module JazzFingers
  module CodeRay
    ESCAPED_COLORS = {
      attribute_name: "\e[33m",
      attribute_value: "\e[31m",
      binary: "\e[1;35m",
      char: {
        self: "\e[36m",
        delimiter: "\e[34m"
      },
      class: "\e[1;35m",
      class_variable: "\e[36m",
      color: "\e[32m",
      comment: "\e[37m",
      complex: "\e[34m",
      constant: "\e[34m\e[4m",
      decoration: "\e[35m",
      definition: "\e[1;32m",
      directive: "\e[32m\e[4m",
      doc: "\e[46m",
      doctype: "\e[1;30m",
      doc_string: "\e[31m\e[4m",
      entity: "\e[33m",
      error: "\e[1;33m\e[41m",
      exception: "\e[1;31m",
      float: "\e[1;35m",
      function: "\e[1;34m",
      global_variable: "\e[42m",
      hex: "\e[1;36m",
      include: "\e[33m",
      integer: "\e[1;34m",
      key: "\e[35m",
      label: "\e[1;15m",
      local_variable: "\e[33m",
      octal: "\e[1;35m",
      operator_name: "\e[1;29m",
      predefined_constant: "\e[1;36m",
      predefined_type: "\e[1;30m",
      predefined: "\e[4m\e[1;34m",
      preprocessor: "\e[36m",
      pseudo_class: "\e[34m",
      regexp: {
        self: "\e[31m",
        content: "\e[31m",
        delimiter: "\e[1;29m",
        modifier: "\e[35m",
        function: "\e[1;29m"
      },
      reserved: "\e[1;31m",
      shell: {
        self: "\e[42m",
        content: "\e[1;29m",
        delimiter: "\e[37m",
      },
      string: {
        self: "\e[36m",
        modifier: "\e[1;32m",
        escape: "\e[1;36m",
        delimiter: "\e[1;32m",
      },
      symbol: "\e[1;31m",
      tag: "\e[34m",
      type: "\e[1;34m",
      value: "\e[36m",
      variable: "\e[34m",

      insert: "\e[42m",
      delete: "\e[41m",
      change: "\e[44m",
      head: "\e[45m"
    }.freeze
  end
end


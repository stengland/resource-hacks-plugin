module ActionController
  module Resources
    class Resource
    
      def member_path
        @member_path || options[:member_path] || "#{path}/:id"
      end

      def nesting_path_prefix
        @nesting_path_prefix || options[:member_path] || "#{path}/:#{singular}_id"
      end

      def requirements(with_id = false)
        @requirements   ||= @options[:requirements] || {}
        @id_requirement ||= options[:member_path].blank? ? { :id => @requirements.delete(:id) || /[^#{Routing::SEPARATORS.join}]+/ } : options[:member_path_requirements] || {}

        with_id ? @requirements.merge(@id_requirement) : @requirements
      end
    end
  end
end

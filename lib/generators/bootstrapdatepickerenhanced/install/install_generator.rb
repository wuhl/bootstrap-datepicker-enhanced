# install_generator.rb

module Bootstrapdatepickerenhanced
	module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator installs Bootstrap Datepicker Rails Enhanced"
      argument :language_type, :type => :string, :default => 'de', :banner => '*de or other language'
      class_option :template_engine, desc: 'Template engine to be invoked (erb, haml or slim).'

      def add_javascripts
    #   	insert_into_file "app/assets/javascripts/application.js", :after => "//= require jquery_ujs\n" do
    #   		"//= require jquery-ui\n"
				# end
      	insert_into_file "app/assets/javascripts/application.js", :after => "//= require bootstrap\n" do
      		"//= require bootstrap-datepicker\n" +
          "//= require bootstrap-datepicker/core\n" +
          "//= require bootstrap-datepicker/locales/bootstrap-datepicker.de.js\n"
				end
      end

      def add_stylesheets
      	insert_into_file "app/assets/stylesheets/application.scss", :after => "@import \"bootstrap\";\n" do
      		"@import \"bootstrap-datepicker\";\n"
				end
      end

      def copy_templates
      	empty_directory "app/inputs"
      	copy_file "date_picker_input.rb", "app/inputs/date_picker_input.rb"
      	copy_file "datepicker.js.coffee", "app/assets/javascripts/datepicker.js.coffee"
      end

			def adjust_forms_file
        engine = options[:template_engine]
        if File.exist? "lib/templates/#{engine}/scaffold/_form.html.#{engine}" and File.exist? "app/inputs/date_picker_input.rb"
          gsub_file "lib/templates/#{engine}/scaffold/_form.html.#{engine}",
					  "<%%= f.<%= attribute.field_type %> :<%= attribute.name %> %>",
						"<%- if attribute.type.in?([:date]) -%>\n" +
            "      <%%= f.text_field :<%= attribute.name %>, :value => l(f.object.<%= attribute.name %>), :input_html => { :size => 10, :maxlength => 10, :language => I18n.locale }, :'data-behaviour' => :datepicker %>\n" +
            "      <%- else -%>\n" +
      			"      <%%= f.<%= attribute.field_type %> :<%= attribute.name %> %>\n" +
            "      <%- end -%>"
				end
			end

    end
  end
end

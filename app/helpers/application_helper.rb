module ApplicationHelper

    def search_form
        s = '<div class="col-xs-4">'
        s += "<form class='input-group input-group' action=#{controller_name} accept-charset='UTF-8'method='get'>"
        s += "<input name='utf8' type='hidden' value='✓'>"
        s += '<input type="text" name="q" id="q" class="form-control">'
        s += '<span class="input-group-btn"> <input type="submit" name="commit" value="Search" class="btn  btn-primary" data-disable-with="Search"></span>'
        s += '</form>'
        s += '</div>'
        s.html_safe
    end



    class BlockHelper
        def initialize(helper)
            @helper = helper
        end
        def respond_to?(method)
            super or helper.respond_to?(method)
        end
        protected
        def helper
            @helper
        end
        def method_missing(method, *args, &block)
            if helper.respond_to?(method)
                self.class_eval "def #{method}(*args, &block); helper.send('#{method}', *args, &block); end"
                self.send(method, *args, &block)
            else
                super
            end
        end
    end


end

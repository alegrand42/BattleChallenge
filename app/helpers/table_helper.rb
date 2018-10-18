module TableHelper

  def collection_table_for(collection, columns, options = {}, &block)
    options[:class] = ['table', 'dataTable', 'table-bordered', options[:class]].compact.join(' ')
    if columns.include?(:actions)
      options[:class] += ' with-actions'
    end

    klass = collection.klass

    rows = []
    collection.each do |object|
      row = TableRow.new(self, columns, object)
      yield(row, object)
      rows << row
    end

    content_tag :table, options do
      content_tag(:thead, get_header(klass, columns)) +
      content_tag(:tbody) do
        html = []
        rows.each { |row| html << row.get_row }
        safe_join(html)
      end
    end
  end

  protected

  def get_header(klass, columns)
    html = []
    columns.each do |column|
      column_name = t(".table.#{column}", default: [klass.human_attribute_name(column, {default: :"helpers.table.#{column}"})])
      if klass.respond_to?(:table_sort_keys) and klass.table_sort_keys.include?(column.to_sym)
        html << content_tag(:th, class: tablesort_order_class(column.to_s)) do
          sort_link_to(column.to_s, column_name)
        end
      else
        html << content_tag(:th, column_name, class: (column == :actions ? 'table-action': nil))
      end
    end
    content_tag :tr do
      safe_join(html)
    end
  end

  class TableRow < ::ApplicationHelper::BlockHelper

    def initialize(helper, columns, object)
      @helper = helper
      @columns = columns
      @object = object
      @row = HashWithIndifferentAccess.new
    end

    def column(attr, options = {}, &block)
      if attr == :actions
        options[:class] = ['table-action', options[:class]].compact.join(' ')
      end
      @row[attr] = {content: helper.capture(&block), options: options}
      nil
    end

    def get_row
      html = []
      @columns.each do |column|
        content = ''
        options = {}
        if @row[column].present?
          content = @row[column][:content]
          options = @row[column][:options]
        elsif @object.respond_to?(column)
          content = @object.send(column)
        end
        if content.kind_of?(DateTime)
          content = l(content)
        elsif !content.kind_of?(String)
          content = "#{content}"
        end

        html << content_tag(:td, content, options)
      end

      content_tag :tr, safe_join(html)

    end
  end

end
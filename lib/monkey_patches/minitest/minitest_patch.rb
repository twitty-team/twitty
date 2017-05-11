require 'rails/test_unit/minitest_plugin.rb'

raise "Consider removing this patch" unless Rails.version == '5.1.0'

module MinitestPatch
  def aggregated_results(*)
    super unless options[:output_inline]
  end
end

Minitest::SuppressedSummaryReporter.prepend(MinitestPatch)

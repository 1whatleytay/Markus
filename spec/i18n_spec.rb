# frozen_string_literal: true

require 'i18n/tasks'

RSpec.describe 'I18n' do
  let(:i18n) { I18n::Tasks::BaseTask.new }
  let(:missing_keys) { i18n.missing_keys(locales: [:en]) }
  let(:unused_keys) { i18n.unused_keys }

  it 'does not have missing English keys' do
    expect(missing_keys)
      .to be_empty,
          "Missing #{missing_keys.leaves.count} i18n keys, run `i18n-tasks missing -l en' to show them"
  end

  it 'does not have unused keys' do
    expect(unused_keys).to be_empty,
                           "#{unused_keys.leaves.count} unused i18n keys, run `i18n-tasks unused' to show them"
  end

  xit 'files are normalized' do
    non_normalized = i18n.non_normalized_paths
    error_message = "The following files need to be normalized:\n" \
                    "#{non_normalized.map { |path| "  #{path}" }.join("\n")}\n" \
                    'Please run `i18n-tasks normalize` to fix'
    expect(non_normalized).to be_empty, error_message
  end
end

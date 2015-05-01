require 'open-uri'
require 'plantuml-encode64'

# Converts PlantUML files to a rendered format using a remote server.
#
class ConvertPlantUML
  class << self
    # TODO: Replace verbose flag with proper logging
    # TODO: Add 'ensures' to make sure the files are closed
    def convert(input: nil, output: nil, type: 'png',
                server: URI.parse('http://www.plantuml.com/plantuml/'),
                verbose: false)
      $stderr.puts "Retrieving data from #{encoded_uri}" if verbose
      open(URI.join(server, "#{type}/",
                    plantuml_encode_from_file_or_stdin(input))) do |response|
        copy_to = ->(file) { IO.copy_stream(response, file) }
        $stderr.puts "Writing output file... #{output}" if verbose
        output ? open(output, 'w', &copy_to) : copy_to.call($stdout)
      end
    end

    private

    def plantuml_encode_from_file_or_stdin(input)
      read_from = ->(file) { file.read }
      PlantUmlEncode64.new(
        input ? open(input, &read_from) : read_from.call($stdin)
      ).encode
    end
  end
end

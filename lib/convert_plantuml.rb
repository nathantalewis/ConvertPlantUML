require 'open-uri'
require 'plantuml-encode64'

class ConvertPlantUML

  #TODO: Replace verbose flag with proper logging
  #TODO: Add 'ensures' to make sure the files are closed
  def self.convert(input: nil, output: nil, type: 'png', server: URI.parse("http://www.plantuml.com/plantuml/"), verbose: false)
    $stderr.puts "Reading input file... #{input}" if verbose
    inputFile = if input then open(input) else $stdin end
    inputString = inputFile.read
    inputFile.close

    encodedURI = URI.join(server, "#{type}/", PlantUmlEncode64.new(inputString).encode())
    $stderr.puts "Retrieving data from #{encodedURI}" if verbose

    response = open(encodedURI) do |response|
      $stderr.puts "Writing output file... #{output}" if verbose
      outputFile = if output then open(output, 'w') else $stdout end
      IO.copy_stream(response, outputFile)
      outputFile.close
    end
  end
end

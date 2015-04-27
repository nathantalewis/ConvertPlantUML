Convert PlantUML Diagrams
=====

A command line tool to convert a PlantUML file to an SVG, PNG or Ascii file using a remote PlantUML server.

Examples
===

```bash
ConvertPlantUML >myPlantUmlFile.plantuml >myOutputImageFile.png
ConvertPlantUML -i myPlantUmlFile.plantuml -o myOutputImageFile.png
```

Both of the above examples will read `myPlantUmlFile.plantuml` and write the resulting PNG image to `myOutputImageFile.png` using the server at http://www.plantuml.com/plantuml/



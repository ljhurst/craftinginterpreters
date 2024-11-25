# Directory structure
SRC_DIR = src/main/java
OUT_DIR = target/classes
FORMATTER_JAR = tools/google-java-format-1.25.0-all-deps.jar

# Java compiler and flags
JAVAC = javac
JAVA = java
JAVAC_FLAGS = -d $(OUT_DIR)

# Main class with package
MAIN_CLASS = com.craftinginterpreters.lox.Lox
GENERATE_AST_CLASS = com.craftinginterpreters.tool.GenerateAst

# Source files
SOURCES = $(wildcard $(SRC_DIR)/com/craftinginterpreters/lox/*.java)
GENERATE_AST_SOURCES = $(SRC_DIR)/com/craftinginterpreters/tool/GenerateAst.java

# Default target
all: compile compile-tool

# Create output directory and compile
compile:
	mkdir -p $(OUT_DIR)
	$(JAVAC) $(JAVAC_FLAGS) $(SOURCES)

# Compile the AST generator
compile-generate-ast:
	mkdir -p $(OUT_DIR)
	$(JAVAC) $(JAVAC_FLAGS) $(GENERATE_AST_SOURCES)

# Run the program with optional file argument
run: compile
	$(JAVA) -cp $(OUT_DIR) $(MAIN_CLASS) $(if $(FILE),$(FILE),)

# Run the AST generator
run-generate-ast: compile-generate-ast
	$(JAVA) -cp $(OUT_DIR) $(GENERATE_AST_CLASS) $(SRC_DIR)/com/craftinginterpreters/lox

# Format code using google-java-format
format:
	@if [ ! -f $(FORMATTER_JAR) ]; then \
		echo "Formatter not found. Please download it:"; \
		echo "mkdir -p tools"; \
		echo "curl -L https://github.com/google/google-java-format/releases/download/v1.25.0/google-java-format-1.25.0-all-deps.jar -o $(FORMATTER_JAR)"; \
		exit 1; \
	fi
	$(JAVA) -jar $(FORMATTER_JAR) --replace $(SOURCES) $(GENERATE_AST_SOURCES)

# Clean build artifacts
clean:
	rm -rf $(OUT_DIR)

.PHONY: all compile run clean format

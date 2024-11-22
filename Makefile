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

# Source files
SOURCES = $(wildcard $(SRC_DIR)/com/craftinginterpreters/lox/*.java)

# Default target
all: compile

# Create output directory and compile
compile:
	mkdir -p $(OUT_DIR)
	$(JAVAC) $(JAVAC_FLAGS) $(SOURCES)

# Run the program with optional file argument
run: compile
	$(JAVA) -cp $(OUT_DIR) $(MAIN_CLASS) $(if $(FILE),$(FILE),)

# Format code using google-java-format
format:
	@if [ ! -f $(FORMATTER_JAR) ]; then \
		echo "Formatter not found. Please download it:"; \
		echo "mkdir -p tools"; \
		echo "curl -L https://github.com/google/google-java-format/releases/download/v1.25.0/google-java-format-1.25.0-all-deps.jar -o $(FORMATTER_JAR)"; \
		exit 1; \
	fi
	$(JAVA) -jar $(FORMATTER_JAR) --replace $(SOURCES)

# Clean build artifacts
clean:
	rm -rf $(OUT_DIR)

.PHONY: all compile run clean format

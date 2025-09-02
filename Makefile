# DarkGhost Core Makefile

CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -O2
SRCDIR = src
OBJDIR = obj
SOURCES = $(SRCDIR)/main.cpp \
          $(SRCDIR)/core/blockchain.cpp \
          $(SRCDIR)/consensus/randomx_v2.cpp \
          $(SRCDIR)/privacy/ringct.cpp \
          $(SRCDIR)/privacy/bulletproofs.cpp \
          $(SRCDIR)/wallet/stealth_address.cpp
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
TARGET = darkghostd

# Default target
all: $(TARGET)

# Link the executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $@ $(LDFLAGS)

# Benchmark target
benchmark: $(OBJECTS) $(OBJDIR)/benchmark.o
	$(CXX) $(OBJECTS) $(OBJDIR)/benchmark.o -o build/benchmark $(LDFLAGS)

# Compile source files to object files
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile benchmark
$(OBJDIR)/benchmark.o: benchmark.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Create directories
$(OBJDIR):
	@mkdir -p $(OBJDIR)
	@mkdir -p $(OBJDIR)/core
	@mkdir -p $(OBJDIR)/consensus
	@mkdir -p $(OBJDIR)/privacy
	@mkdir -p $(OBJDIR)/wallet

# Clean build files
clean:
	rm -rf $(OBJDIR) $(TARGET)

# Rebuild everything
rebuild: clean all

# Install (placeholder)
install:
	@echo "Installing DarkGhost daemon..."
	@echo "Copy $(TARGET) to /usr/local/bin/ or appropriate directory"

.PHONY: all clean rebuild install

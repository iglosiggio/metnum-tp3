# From: https://github.com/tdegeus/pybind11_examples#diy
CXXFLAGS += -I../eigen/           \
            -I../pybind11/include \
            -shared -fPIC         \
            $$(python3-config --cflags --ldflags --libs)

all: metnum.so

metnum.so: metnum.cpp
	$(CXX) $(CXXFLAGS) $^ -o $@

clean:
	rm -f *.o
	rm -f metnum.so

.PHONY: all clean

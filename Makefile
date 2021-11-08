# From: https://github.com/tdegeus/pybind11_examples#diy
CXXFLAGS += -Ieigen/           \
            -Ipybind11/include \
            -shared -fPIC      \
            $$(python3-config --cflags --ldflags --libs)

all: metnum.so

metnum.so: metnum.cpp
	$(CXX) $(CXXFLAGS) $^ -o $@

clean:
	rm -f metnum.so

.PHONY: all clean

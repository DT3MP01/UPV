var obj = {
	a: 2,
	b: 3,
	c: 4
};

obj.a = obj.b = obj.c;
obj.c = obj.c = obj.a;

with (obj) {
	a = b + c;
	d = b - a;
	d = 3;      
}

obj.d;
d;
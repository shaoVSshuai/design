/*******************************************************************************
 * BFW ListApplet Control JavaScript Object:BFW MAP 数据对象 仿照java.util.Map**
 ******************************************************************************/

function BFWMap() {
	this.keySet = new Array();
	this.entrySet = new Array();
}

BFWMap.prototype.clear = function() {
	this.keySet = new Array();
	this.entrySet = new Array();
};

BFWMap.prototype.containsKey = function(_objectKey) {
	for ( var i = 0; i < this.keySet.length; i++) {
		if (this.keySet[i] == _objectKey)
			return true;
	}
	return false;
};

BFWMap.prototype.containsValue = function(_objectValue) {
	for ( var i = 0; i < this.entrySet; i++) {
		if (this.entrySet[i] == _objectValue)
			return true;
	}
	return false;
};

BFWMap.prototype.get = function(_objectKey) {
	for ( var i = 0; i < this.keySet.length; i++) {
		if (this.keySet[i] == _objectKey)
			return this.entrySet[i];
	}
	return null;
};

BFWMap.prototype.isEmpty = function() {
	if (this.keySet.length == 0)
		return true;
	else
		return false;
};

BFWMap.prototype.put = function(_objectKey, _objectValue) {
	this.keySet.push(_objectKey);
	this.entrySet.push(_objectValue);
};

BFWMap.prototype.remove = function(_objectKey) {
	alert("not support now.");
};

BFWMap.prototype.size = function() {
	this.keySet.length;
};

// Map的实现
function Map() {
	this.array = new Array();

	// 结构
	function struct(key, value) {
		this.key = key;
		this.value = value;
	}
	;

	// 增加
	this.put = function(key, value) {
		for ( var i = 0; i < this.array.length; i++) {
			if (this.array[i].key == key) {
				this.array[i].value = value;
				return;
			}
		}
		this.array[this.array.length] = new struct(key, value);
	};

	// 取值
	this.get = function(key) {
		for ( var i = 0; i < this.array.length; i++) {
			if (this.array[i].key == key) {
				return this.array[i].value;
			}
		}
		return null;
	};

	// 删除
	this.remove = function(key) {
		var v;
		for ( var i = 0; i < this.array.length; i++) {
			v = this.array.pop();
			if (v.key == key) {
				continue;
			}
			this.array.unshift(v);
		}
	};

	// 长度
	this.size = function() {
		return this.array.length;
	};

	// 是否为空
	this.isEmpty = function() {
		return this.array.length <= 0;
	};

	// 是否包含主键
	this.containsKey = function(key) {
		for ( var i = 0; i < this.array.length; i++) {
			if (this.array[i].key == key) {
				return true;
			}
		}
		return false;
	};

	// 取全部值
	this.values = function() {
		var valueArray = new Array();
		for ( var i = 0; i < this.array.length; i++) {
			valueArray.push(this.array[i].value);
		}
		return valueArray;
	};

	// 清空
	this.clear = function() {
		this.array = [];
	};
}

//通过提供的方法，把Array转换为Map
function arrayToMap(array, key, value) {
	if (key == undefined) {
		key = function(arg) {return arg.key;};
	}
	
	if (value == undefined) {
		value = function(arg) {return arg.value;};
	}
	
	var map = new Map();
	for (data in array) {
		map.put(key(array[data]), value(array[data]));
	}

	return map;
}


//通过提供的方法，把Array转换为Map
function arrayToMapArray(array, key, value) {
	if (key == undefined) {
		key = function(arg) {return arg.key;};
	}
	
	if (value == undefined) {
		value = function(arg) {return arg.value;};
	}
	
	var map = new Map();
	for (data in array) {
		var varray= new Array();
		if(map.containsKey(key(array[data]))){
			varray=map.get(key(array[data]))
		}
		varray.push(value(array[data]));
		map.put(key(array[data]), varray);
	}

	return map;
}

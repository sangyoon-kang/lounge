var dates = $.fn.datepicker.dates = {
		en: {
			days: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
			daysShort: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
			daysMin: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"],
			months: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
			monthsShort: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
			today: "Today",
			clear: "Clear"
		}
	};
formatDate = function(date, format){
	if (!date)
		return '';
	if (typeof format === 'string')
		format = DPGlobal.parseFormat(format);
	var val = {
		d: date.getUTCDate(),
//		D: dates[language].daysShort[date.getUTCDay()],
//		DD: dates[language].days[date.getUTCDay()],
		//m: date.getUTCMonth() + 1,
		M: date.getUTCMonth() + 1,
		MM: date.getUTCMonth() + 1,
		yy: date.getUTCFullYear().toString().substring(2),
		yyyy: date.getUTCFullYear(),
		HH: date.getHours(),
		mm: date.getMinutes()
	};
	val.dd = (val.d < 10 ? '0' : '') + val.d;
	val.mm = (val.mm < 10 ? '0' : '') + val.mm;
	val.HH = (val.HH < 10 ? '0' : '') + val.HH;
	var date = [],
		seps = $.extend([], format.separators);
	for (var i=0, cnt = format.parts.length; i <= cnt; i++) {
		if (seps.length)
			date.push(seps.shift());
		date.push(val[format.parts[i]]);
	}
	return date.join('');
};

var DPGlobal = {
	modes: [
		{
			clsName: 'days',
			navFnc: 'Month',
			navStep: 1
		},
		{
			clsName: 'months',
			navFnc: 'FullYear',
			navStep: 1
		},
		{
			clsName: 'years',
			navFnc: 'FullYear',
			navStep: 10
	}],
	isLeapYear: function (year) {
		return (((year % 4 === 0) && (year % 100 !== 0)) || (year % 400 === 0));
	},
	getDaysInMonth: function (year, month) {
		return [31, (DPGlobal.isLeapYear(year) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month];
	},
	validParts: /dd?|DD?|mm?|MM?|HH?|yy(?:yy)?/g,
	nonpunctuation: /[^ -\/:-@\[\u3400-\u9fff-`{-~\t\n\r]+/g,
	parseFormat: function(format){
		// IE treats \0 as a string end in inputs (truncating the value),
		// so it's a bad format delimiter, anyway
		var separators = format.replace(this.validParts, '\0').split('\0'),
			parts = format.match(this.validParts);
		if (!separators || !separators.length || !parts || parts.length === 0){
			throw new Error("Invalid date format.");
		}
		return {separators: separators, parts: parts};
	}
}
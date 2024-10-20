(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else if (typeof module === "object" && module.exports) {
		module.exports = factory( require( "jquery" ) );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: ID (Indonesia; Indonesian)
 */
$.extend( $.validator.messages, {
	required: "Harap mengisi kolom ini.",
	remote: "Harap benarkan kolom ini.",
	email: "Harap isi dengan format email yang benar.",
	url: "Harap isi dengan format URL yang benar.",
	date: "Harap isi dengan format tanggal yang benar.",
	dateISO: "Harap isi dengan format tanggal(ISO) yang benar.",
	number: "Harap isi dengan angka yang benar.",
	digits: "Harap isi angka saja.",
	creditcard: "Harap isi dengan format kartu kredit yang benar.",
	equalTo: "Harap isi dengan nilai yg sama dengan sebelumnya.",
	maxlength: $.validator.format( "Isian dibatasi hanya {0} karakter." ),
	minlength: $.validator.format( "Isian tidak kurang dari {0} karakter." ),
	rangelength: $.validator.format( "Panjang karakter yg diizinkan antara {0} dan {1} karakter." ),
	range: $.validator.format( "Harap isi dengan nilai antara {0} dan {1}." ),
	max: $.validator.format( "Harap isi dengan nilai lebih kecil atau sama dengan {0}." ),
	min: $.validator.format( "Harap isi dengan nilai lebih besar atau sama dengan {0}." )
} );
return $;
}));
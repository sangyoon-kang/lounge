/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here.
	// For complete reference see:
	// http://docs.ckeditor.com/#!/api/CKEDITOR.config

	// The toolbar groups arrangement, optimized for two toolbar rows.
	config.toolbarGroups = [
		{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
		{ name: 'links' },
		{ name: 'insert' },
		{ name: 'forms' },
		{ name: 'tools' },
		{ name: 'document',	   groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'others' },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
		{ name: 'styles' },
		{ name: 'colors' },
		{ name: 'about' }
	];
	
	config.allowedContent = true;


	//config.uiColor = '#F7B42C';
	config.removeButtons = 'Underline,Subscript,Superscript';
	config.enterMode =		CKEDITOR.ENTER_BR;		//엔터키 입력시 br 태그 변경
	// Set the most common block elements.
	config.removeDialogTabs = 'image:advanced;link:advanced';
	
	//-- 이미지 업로드 관련 설정 
	config.language = 'ko';
	config.filebrowserImageUploadUrl = '/common/ckeditor_upload';
	
	
	//dialogDefinition.removeContents('Link');
	//dialogDefinition.removeContents('advanced');
 
	//-- 홈페이지  CSS include
	config.contentsCss = ['/common/css/user/default/common.css'];
};

//이미지 파일 업로드 다이얼로그 내 링크, 고급 탭 제거
CKEDITOR.on('dialogDefinition', function(ev) {
	var dialogName = ev.data.name;
	var dialogDefinition = ev.data.definition;
	switch (dialogName) {
		case 'image': //Image Properties dialog
			//dialogDefinition.removeContents('info');
			dialogDefinition.removeContents('Link');
			dialogDefinition.removeContents('advanced');
			break;
	}
});	

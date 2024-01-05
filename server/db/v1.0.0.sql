-- add plugin entry in the plugin table
INSERT IGNORE INTO plugins (name, version) 
VALUES ('mobile-styles', 'v1.0.0');

-- Add new style shortcutButton
INSERT IGNORE INTO `styles` (`name`, `id_type`, id_group, `description`) VALUES ('shortcutButton', '1', (select id from styleGroup where `name` = 'Mobile' limit 1), 'Exacute shortcut commands in the mobile app that can open native windows. The functinality is based on [capacitor-native-settings](https://github.com/RaphaelWoude/capacitor-native-settings)');
INSERT IGNORE INTO `styles_fields` (`id_styles`, `id_fields`, `default_value`, `help`) VALUES (get_style_id('shortcutButton'), get_field_id('css'), NULL, 'Allows to assign CSS classes to the root item of the style.');
INSERT IGNORE INTO `styles_fields` (`id_styles`, `id_fields`, `default_value`, `help`) VALUES (get_style_id('shortcutButton'), get_field_id('css_mobile'), NULL, 'Allows to assign CSS classes to the root item of the style for the mobile version.');
INSERT IGNORE INTO `styles_fields` (`id_styles`, `id_fields`, `default_value`, `help`) VALUES (get_style_id('shortcutButton'), get_field_id('condition'), NULL, 'The field `condition` allows to specify a condition. Note that the field `condition` is of type `json` and requires\n1. valid json syntax (see https://www.json.org/)\n2. a valid condition structure (see https://github.com/jwadhams/json-logic-php/)\n\nOnly if a condition resolves to true the sections added to the field `children` will be rendered.\n\nIn order to refer to a form-field use the syntax `"@__form_name__#__from_field_name__"` (the quotes are necessary to make it valid json syntax) where `__form_name__` is the value of the field `name` of the style `formUserInput` and `__form_field_name__` is the value of the field `name` of any form-field style.');
INSERT IGNORE INTO `styles_fields` (`id_styles`, `id_fields`, `default_value`, `help`) VALUES (get_style_id('shortcutButton'), get_field_id('data_config'), '', 'Define data configuration for fields that are loaded from DB and can be used inside the style with their param names. The name of the field can be used between {{param_name}} to load the required value');

-- Add new field `shortcut-ios` in style shortcutButton
INSERT IGNORE INTO `fields` (`id`, `name`, `id_type`, `display`) VALUES (NULL, 'shortcut_ios', get_field_type_id('text'), '0');
INSERT IGNORE INTO `styles_fields` (`id_styles`, `id_fields`, `default_value`, `help`) 
VALUES (get_style_id('shortcutButton'), get_field_id('shortcut_ios'), '', 'Write the shortcut value from [these iOS commands](https://github.com/RaphaelWoude/capacitor-native-settings?tab=readme-ov-file#iossettings). Select the value from the column `value` without the quotes.');

-- Add new field `shortcut-android` in style shortcutButton
INSERT IGNORE INTO `fields` (`id`, `name`, `id_type`, `display`) VALUES (NULL, 'shortcut_android', get_field_type_id('text'), '0');
INSERT IGNORE INTO `styles_fields` (`id_styles`, `id_fields`, `default_value`, `help`) 
VALUES (get_style_id('shortcutButton'), get_field_id('shortcut_android'), '', 'Write the shortcut value from [these Android commands](https://github.com/RaphaelWoude/capacitor-native-settings?tab=readme-ov-file#androidsettings). Select the value from the column `value` without the quotes.');

-- add field `label` in style `shortcutButton`
INSERT IGNORE INTO `styles_fields` (`id_styles`, `id_fields`, `default_value`, `help`) VALUES (get_style_id('shortcutButton'), get_field_id('label'), '', 'The text to appear on the button.');

-- add field `type` in style `shortcutButton`
INSERT IGNORE INTO `styles_fields` (`id_styles`, `id_fields`, `default_value`, `help`) VALUES (get_style_id('shortcutButton'), get_field_id('type'), 'primary', 'The <a href="https://getbootstrap.com/docs/4.1/components/buttons/#examples" target="_blank">bootstrap type</a> of the button.');
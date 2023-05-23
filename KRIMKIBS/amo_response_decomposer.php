<?php

function getCustomFieldValues($contact, $fieldIds) {
    $customFields = $contact->custom_fields_values;
    $result = array();
    foreach ($fieldIds as $fieldId) {
        foreach ($customFields as $customField) {
            if ($customField->field_id == $fieldId) {
                $values = $customField->values;
                $result[$fieldId] = $values[0]->value;
                break;
            }
        }
    }
    return $result;
}

?>
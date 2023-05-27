<?php

function getCustomFieldValues($contact, $fieldIds) {
    $customFields = $contact->custom_fields_values;
    $result = array();
    foreach ($fieldIds as $fieldId) {
        foreach ($customFields as $customField) {
            if ($customField->field_id == $fieldId) {
                $values = $customField->values;
                $result[$fieldId] = "";
                foreach($values as $key => $value){
                    $result[$fieldId] = $result[$fieldId]  . $value->value . ", ";
                }
                $result[$fieldId] = substr($result[$fieldId], 0, strlen($result[$fieldId]) - 2);
                break;
            }
        }
    }
    return $result;
}
?>
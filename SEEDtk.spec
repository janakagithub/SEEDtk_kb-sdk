/*
A KBase module: SEEDtk
This module contains various methods for accessing SEEDtk.
*/

module SEEDtk {
    /*
        A string representing a ContigSet id.
    */
    typedef string contigset_id;

    /*
        A string representing a workspace name.
    */
    typedef string workspace_name;


    /* description of a role missing in the contigs */

	typedef structure {
        string role_id;
        string role_description;
        int genome_hits;
        float blast_score;
        float perc_identity;
        string hit_location;
    } MissingRoleItem;

    typedef structure {
        list<MissingRoleItem> roles;
        contigset_id contigset_id;
    } MissingRoleData;

    typedef string genome_id;
    typedef string genome_name;

    /*
        find missing roles in a set of contigs
    */
    funcdef missing_roles(workspace_name, contigset_id, genome_id, genome_name) returns (MissingRoleData) authentication required;
};
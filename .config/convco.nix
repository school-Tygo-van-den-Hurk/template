{
  issuePrefixes = [
    "#"
    "(#"
  ];

  types = [
    {
      type = "feat";
      section = "New Features";
      increment = "Minor";
      hidden = false;
    }
    {
      type = "fix";
      section = "Bug Fixes";
      increment = "Patch";
      hidden = false;
    }
    {
      type = "perf";
      section = "Performance Improvements";
      increment = "Patch";
      hidden = false;
    }
    {
      type = "docs";
      section = "Documentation";
      increment = "None";
      hidden = false;
    }
    {
      type = "deps";
      section = "Dependency Changes";
      increment = "Patch";
      hidden = false;
    }
    {
      type = "test";
      section = "Code Quality and Tests";
      increment = "None";
      hidden = false;
    }
    {
      type = "ci";
      section = "CI/CD";
      increment = "None";
      hidden = true;
    }
    {
      type = "chore";
      section = "Maintenance";
      increment = "None";
      hidden = true;
    }
    {
      type = "style";
      section = "Other";
      increment = "None";
      hidden = true;
    }
    {
      type = "build";
      section = "Other";
      increment = "None";
      hidden = true;
    }
    {
      type = "refactor";
      section = "Other";
      increment = "None";
      hidden = true;
    }
  ];
}

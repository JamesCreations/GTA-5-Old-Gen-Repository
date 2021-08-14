class com.rockstargames.gtav.levelDesign.hangarCargo.Organisation
{
   function Organisation(_nom, _members)
   {
      this._nom = _nom;
      this._members = _members;
   }
   function __get__name()
   {
      return this._nom;
   }
   function __get__members()
   {
      return this._members;
   }
}

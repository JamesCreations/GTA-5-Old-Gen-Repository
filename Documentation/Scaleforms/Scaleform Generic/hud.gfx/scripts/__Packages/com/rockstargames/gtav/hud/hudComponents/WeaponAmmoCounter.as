class com.rockstargames.gtav.hud.hudComponents.WeaponAmmoCounter extends MovieClip
{
   function WeaponAmmoCounter()
   {
      super();
   }
   function SET_AMMO_COUNT(params)
   {
      var _loc4_ = params[3];
      switch(_loc4_)
      {
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_STUNGUN:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_UNARMED:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_WRENCH:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_SHOVEL:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_NIGHTSTICK:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_LASSO:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_KNIFE:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_HAMMER:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_CROWBAR:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_BAT:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_GOLFCLUB:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_FIRE_EXTINGUISHER:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_JERRY_CAN:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_BOTTLE:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_DAGGER:
         case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_HATCHET:
            break;
         default:
            var _loc2_ = String(params[0]);
            var _loc3_ = String(params[1]);
            var _loc6_ = params[2];
            if(_loc6_ <= 1)
            {
               this.clipTF.text = "";
            }
            else
            {
               this.clipTF.text = "/ " + _loc3_;
            }
            if(_loc2_ == "-1")
            {
               if(_loc3_ == "-1")
               {
                  this.clipTF.text = "";
               }
               _loc2_ = "";
            }
            if(_loc2_ == "-2")
            {
               _loc2_ = "<";
               if(_loc3_ == "-1")
               {
                  this.clipTF.text = "";
               }
            }
            if(_loc4_ == com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_HEAVY_MINIGUN)
            {
               this.clipTF.text = "";
            }
            this.adjustAmmo(this.clipTF.text == "",_loc2_);
            this.ammoStrokeTF.text = this.ammoTF.text;
            this.clipStrokeTF.text = this.clipTF.text;
            this.ammoCenterStrokeTF.text = this.ammoCenterTF.text;
      }
      this.ammoTF.text = "";
      this.clipTF.text = "";
      this.ammoCenterTF.text = "";
      this.ammoStrokeTF.text = this.ammoTF.text;
      this.clipStrokeTF.text = this.clipTF.text;
      this.ammoCenterStrokeTF.text = this.ammoCenterTF.text;
   }
   function adjustAmmo(isCentered, ammoStr)
   {
      this.ammoTF.text = !isCentered?ammoStr:"";
      this.ammoCenterTF.text = !isCentered?"":ammoStr;
   }
}

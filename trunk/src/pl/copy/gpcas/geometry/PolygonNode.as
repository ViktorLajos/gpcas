/*
 * This license does NOT supersede the original license of GPC.  Please see:
 * http://www.cs.man.ac.uk/~toby/alan/software/#Licensing
 *
 * The SEI Software Open Source License, Version 1.0
 *
 * Copyright (c) 2004, Solution Engineering, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer. 
 *
 * 2. The end-user documentation included with the redistribution,
 *    if any, must include the following acknowledgment:
 *       "This product includes software developed by the
 *        Solution Engineering, Inc. (http://www.seisw.com/)."
 *    Alternately, this acknowledgment may appear in the software itself,
 *    if and wherever such third-party acknowledgments normally appear.
 *
 * 3. The name "Solution Engineering" must not be used to endorse or
 *    promote products derived from this software without prior
 *    written permission. For written permission, please contact
 *    admin@seisw.com.
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL SOLUTION ENGINEERING, INC. OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
 * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 * ====================================================================
 */

package pl.bmnet.gpcas.geometry {


   /**
    * Internal contour / tristrip type
    */
   public class PolygonNode
   {
      var active:int;                 /* Active flag / vertex count        */
      var hole:Boolean;                   /* Hole / external contour flag      */
      var v:Array= new Array(2) ; /* Left and right vertex list ptrs   */
      var next:PolygonNode;                   /* Pointer to next polygon contour   */
      var proxy:PolygonNode;                  /* Pointer to actual structure used  */
      
      public function PolygonNode( next:PolygonNode, x:Number, y:Number)
      {
         /* Make v[Clip.LEFT] and v[Clip.RIGHT] point to new vertex */
         var vn:VertexNode= new VertexNode( x, y );
         this.v[Clip.LEFT ] = vn ;
         this.v[Clip.RIGHT] = vn ;
         
         this.next = next ;
         this.proxy = this ; /* Initialise proxy to point to p itself */
         this.active = 1; //TRUE
      }
      
      public function add_right( x:Number, y:Number):void {
         var nv:VertexNode= new VertexNode( x, y );
         
         /* Add vertex nv to the right end of the polygon's vertex list */
         proxy.v[Clip.RIGHT].next= nv;
         
         /* Update proxy->v[Clip.RIGHT] to point to nv */
         proxy.v[Clip.RIGHT]= nv;
      }
      
      public function add_left( x:Number, y:Number):void {
         var nv:VertexNode= new VertexNode( x, y );
         
         /* Add vertex nv to the left end of the polygon's vertex list */
         nv.next= proxy.v[Clip.LEFT];
         
         /* Update proxy->[Clip.LEFT] to point to nv */
         proxy.v[Clip.LEFT]= nv;
      }

   }


}